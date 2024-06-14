using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace DW_ETL_Example
{
    public partial class FormExtractLoad : Form
    {
        MySqlConnection myConnOLTP;
        MySqlCommand myCmdOLTP = new MySqlCommand(); 

        MySqlConnection myConnOLAP;
        MySqlCommand myCmdOLAP = new MySqlCommand();
        MySqlDataAdapter myAdapter;
        DataTable dt;
        string originOLTP;
        bool statConnOLTP = false;
        bool statConnOLAP = false;

        public FormExtractLoad()
        {
            InitializeComponent();
        }

        private void FormExtractLoad_Load(object sender, EventArgs e)
        {
            disconnectedOLTPComponent();
            disconnectedOLAPComponent();
        }

        private void btnConnectOLTP_Click(object sender, EventArgs e)
        {
            connToSelectedOLTP(tbUserOLTP.Text, tbPassOLTP.Text, cbDBNameOLTP.Text);
            connectedOLTPComponent();
        }

        private void btnDiscOLTP_Click(object sender, EventArgs e)
        {
            disconnectedOLTPComponent();
            statConnOLTP = false;
            MessageBox.Show("Koneksi DATABASE LOCAL / OLTP DIPUTUS!");
            myConnOLTP.Close();
        }

        private void connectedOLTPComponent()
        {
            cbDBNameOLTP.Enabled = false;
            tbUserOLTP.Enabled = false;
            tbPassOLTP.Enabled = false;
            btnConnectOLTP.Enabled = false;
            btnDiscOLTP.Enabled = true;
            btnExtract.Enabled = true;
            cbTable.Enabled = true;
            dgvExtractedData.DataSource = null;
            dgvExtractedData.Refresh();
            dgvExtractedData.Enabled = true;
            lblStatOLTP.Text = "Status OLTP : Connected";
            if (statConnOLTP && statConnOLAP && cbTable.SelectedIndex != 0)
                btnTL.Enabled = true;
            else
                btnTL.Enabled = false;
        }

        private void disconnectedOLTPComponent()
        {
            cbDBNameOLTP.SelectedIndex = 0;
            cbDBNameOLTP.Enabled = true;
            tbUserOLTP.Enabled = true;
            tbPassOLTP.Enabled = true;
            btnDiscOLTP.Enabled = false;
            btnConnectOLTP.Enabled = true;
            cbTable.SelectedIndex = 0;
            cbTable.Enabled = false;
            btnTL.Enabled = false;
            btnExtract.Enabled = false;
            dgvExtractedData.DataSource = null;
            dgvExtractedData.Refresh();
            dgvExtractedData.Enabled = false;
            lblStatOLTP.Text = "Status OLTP : Disconnected";
            dgvExtractedData.DataSource = null;
            if (statConnOLTP && statConnOLAP && cbTable.SelectedIndex != 0)
                btnTL.Enabled = true;
            else
                btnTL.Enabled = false;
        }

        private void connToSelectedOLTP(string user, string pass, string db_name)
        {
            try
            {
                myConnOLTP = new MySqlConnection("SERVER=127.0.0.1;PORT=3306;UID=" + user + ";PASSWORD=" + pass + ";DATABASE=" + db_name);

                if (myConnOLTP.State == ConnectionState.Closed)
                {
                    myConnOLTP.Open();
                    MessageBox.Show("Berhasil TERKONEKSI ke DATABASE LOCAL / OLTP");
                    statConnOLTP = true;
                    lblStatOLTP.Text = "Status OLTP : Connected";
                }
                else if (myConnOLTP.State == ConnectionState.Open)
                {
                    MessageBox.Show("Koneksi masih TERBUKA");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void connToOLAPDB(string host, string user, string pass, string db_name)
        {
            try
            {
                myConnOLAP = new MySqlConnection("SERVER=" + host + ";PORT=3306;UID=" + user + ";PASSWORD=" + pass + ";DATABASE=" + db_name);

                if (myConnOLAP.State == ConnectionState.Closed)
                {
                    myConnOLAP.Open();
                    MessageBox.Show("Berhasil TERKONEKSI ke DATA WAREHOUSE (" + host + ")");
                    statConnOLAP = true;
                    lblStatOLAP.Text = "Status OLAP : Connected";
                }
                else if (myConnOLAP.State == ConnectionState.Open)
                {
                    MessageBox.Show("Koneksi masih TERBUKA");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void cbTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            dgvExtractedData.DataSource = null;
            btnTL.Enabled = false;
        }

        private void btnExtract_Click(object sender, EventArgs e)
        {
            extractData(cbTable.Text);
            if (statConnOLTP && statConnOLAP && cbTable.SelectedIndex != 0)
                btnTL.Enabled = true;
            else
                btnTL.Enabled = false;
        }

        private void extractData(string tb_name)
        {
            try
            {
                string cmdText;
                if (tb_name == "product")
                {
                    cmdText = "SELECT * FROM `" + tb_name + "`;";
                    myAdapter = new MySqlDataAdapter(cmdText, myConnOLTP);
                    dt = new DataTable();
                    myAdapter.Fill(dt);
                    dgvExtractedData.DataSource = dt;
                    dgvExtractedData.Refresh();
                }
                else if (tb_name == "order")
                {
                    cmdText = "SELECT order_id, customer_id, DATE_FORMAT(order_date,'%Y-%m-%d') as Order_Date, total_price, is_warehouse FROM `" + tb_name + "` WHERE is_warehouse = 0 ORDER BY 1;";
                    myAdapter = new MySqlDataAdapter(cmdText, myConnOLTP);
                    dt = new DataTable();
                    myAdapter.Fill(dt);
                    dgvExtractedData.DataSource = dt;
                    dgvExtractedData.Refresh();
                }
                else
                {
                    cmdText = "SELECT * FROM `" + tb_name + "` WHERE is_warehouse = 0 ORDER BY 1;";
                    myAdapter = new MySqlDataAdapter(cmdText, myConnOLTP);
                    dt = new DataTable();
                    myAdapter.Fill(dt);
                    dgvExtractedData.DataSource = dt;
                    dgvExtractedData.Refresh();
                }  
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void btnConnectOLAP_Click(object sender, EventArgs e)
        {
            connToOLAPDB(tbHostOLAP.Text, tbUserOLAP.Text, tbPassOLAP.Text, tbDBNameOLAP.Text);
            connectedOLAPComponent();
        }

        private void btnDiscOLAP_Click(object sender, EventArgs e)
        {
            disconnectedOLAPComponent();
            statConnOLAP = false;
            MessageBox.Show("Koneksi DATA WAREHOUSE / OLAP DIPUTUS!");
            myConnOLAP.Close();
        }

        private void connectedOLAPComponent()
        {
            tbHostOLAP.Enabled = false;
            tbDBNameOLAP.Enabled = false;
            tbUserOLAP.Enabled = false;
            tbPassOLAP.Enabled = false;
            btnConnectOLAP.Enabled = false;
            btnDiscOLAP.Enabled = true;
            lblStatOLAP.Text = "Status OLAP : Connected";
            if (statConnOLTP && statConnOLAP && cbTable.SelectedIndex != 0)
                btnTL.Enabled = true;
            else
                btnTL.Enabled = false;
        }

        private void disconnectedOLAPComponent()
        {
            tbHostOLAP.Enabled = true;
            tbDBNameOLAP.Enabled = true;
            tbUserOLAP.Enabled = true;
            tbPassOLAP.Enabled = true;
            btnConnectOLAP.Enabled = true;
            btnDiscOLAP.Enabled = false;
            lblStatOLAP.Text = "Status OLAP : Disconnected";
            dgvExtractedData.DataSource = null;
            if (statConnOLTP && statConnOLAP && cbTable.SelectedIndex != 0)
                btnTL.Enabled = true;
            else
                btnTL.Enabled = false;
        }

        private void btnTL_Click(object sender, EventArgs e)
        {
            if (cbDBNameOLTP.Text == "branch1") originOLTP = "Nathan";
            else if (cbDBNameOLTP.Text == "branch2") originOLTP = "Sergio";
            else if (cbDBNameOLTP.Text == "branch3") originOLTP = "Carlos";
            else if (cbDBNameOLTP.Text == "branch4") originOLTP = "Sulthan";

            if (cbTable.Text.Equals("customer"))
            {
                loadCustomers();
            }
            else if (cbTable.Text.Equals("product"))
            {
                loadProduct();
            }
            /*
            else if (cbTable.Text.Equals("product_inventory"))
            {
                loadProductInventory();
            }
            */
            else if (cbTable.Text.Equals("order"))
            {
                loadOrders();
            }
            else if (cbTable.Text.Equals("order_detail"))
            {
                loadOrderDetails();
            }
            /*
            else if (cbTable.Text.Equals("cart"))
            {
                loadCart();
            }
            else if (cbTable.Text.Equals("wishlist"))
            {
                loadWishlist();
            }
            */
            btnExtract_Click(sender, e);
        }

        private void loadCustomers()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    myCmdOLAP.CommandText = "INSERT INTO customer (customer_id, name, email, phone, password, customer_origin) VALUES ('" + 
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "','" + 
                                            dt.Rows[i][3].ToString() + "','" + dt.Rows[i][4].ToString() + "','" + originOLTP + "')";
                    myCmdOLAP.ExecuteNonQuery();

                    myCmdOLTP.CommandText = "UPDATE customer SET is_warehouse = 1 WHERE customer_id='" + dt.Rows[i][0].ToString() + "';";
                    myCmdOLTP.ExecuteNonQuery();
                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void loadProduct()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    myCmdOLAP.CommandText = "INSERT INTO product (product_id, name, brand, color, category, gender, product_price, picture) VALUES ('" +
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "','" +
                                            dt.Rows[i][3].ToString() + "','" + dt.Rows[i][4].ToString() + "','" + dt.Rows[i][5].ToString() + "','" + 
                                            dt.Rows[i][6].ToString() + "','" + dt.Rows[i][7].ToString() + "')";
                    myCmdOLAP.ExecuteNonQuery();
                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        /*
        private void loadProductInventory()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    myCmdOLAP.CommandText = "INSERT INTO product_inventory (productinventory_Id, product_id, size, stock) VALUES ('" +
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "','" +
                                            dt.Rows[i][3].ToString() + "')";
                    myCmdOLAP.ExecuteNonQuery();
                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        */

        private void loadOrders()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    myCmdOLAP.CommandText = "INSERT INTO `order` (order_id, customer_id, order_date, total_price, order_origin) VALUES ('" +
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "','" + 
                                            dt.Rows[i][3].ToString() + "','" + originOLTP + "')";
                    myCmdOLAP.ExecuteNonQuery();

                    myCmdOLTP.CommandText = "UPDATE `order` SET is_warehouse = 1 WHERE order_id='" + dt.Rows[i][0].ToString() + "';";
                    myCmdOLTP.ExecuteNonQuery();

                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void loadOrderDetails()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    
                    myCmdOLAP.CommandText = "INSERT INTO order_detail (orderdetail_id, order_id, product_id, size, quantity, product_price) VALUES ('" + 
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "','" + 
                                            dt.Rows[i][3].ToString() + "','" + dt.Rows[i][4].ToString() + "','" + dt.Rows[i][5].ToString() + "')";
                    myCmdOLAP.ExecuteNonQuery();

                    myCmdOLTP.CommandText = "UPDATE order_detail SET is_warehouse = 1 WHERE orderdetail_id='" + dt.Rows[i][0].ToString() + "';";
                    myCmdOLTP.ExecuteNonQuery();
                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        /*
        private void loadCart()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    myCmdOLAP.CommandText = "INSERT INTO cart (id_cart, customer_id, product_id, product_price, cart_origin) VALUES ('" +
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "','" +
                                            dt.Rows[i][3].ToString() + "','" + originOLTP + "')";
                    myCmdOLAP.ExecuteNonQuery();

                    myCmdOLTP.CommandText = "UPDATE cart SET is_warehouse = 1 WHERE id_cart='" + dt.Rows[i][0].ToString() + "';";
                    myCmdOLTP.ExecuteNonQuery();

                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void loadWishlist()
        {
            try
            {
                myCmdOLTP.Connection = myConnOLTP;
                myCmdOLAP.Connection = myConnOLAP;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    myCmdOLAP.CommandText = "INSERT INTO wishlist (id_wishlist, product_id, wishlist_origin) VALUES ('" +
                                            dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + originOLTP + "')";
                    myCmdOLAP.ExecuteNonQuery();

                    myCmdOLTP.CommandText = "UPDATE wishlist SET is_warehouse = 1 WHERE id_wishlist='" + dt.Rows[i][0].ToString() + "';";
                    myCmdOLTP.ExecuteNonQuery();

                }
                MessageBox.Show("Berhasil LOAD DATA ke DW utk table " + cbTable.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        */

        private void FormExtractLoad_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (myConnOLTP != null)
                if (myConnOLTP.State == ConnectionState.Open) myConnOLTP.Close();
            if (myConnOLAP != null)
                if (myConnOLAP.State == ConnectionState.Open) myConnOLAP.Close();
        }
    }
}
