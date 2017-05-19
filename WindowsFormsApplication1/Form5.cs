using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form5 : Form
    {
        public bool Exists_orNot = false;
        public static int i;
        public static int j;
        public static char Value;
        public char Space= ' ';
        public Form5()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (i == 0 || j == 0 || Value == ' ')
            {
                MessageBox.Show("Enter a valid value :D");
            }
            else
            {
                if (i == j)
                {
                    if (Space != Form3.unsolved[i * j - 1])
                    {
                        MessageBox.Show("Position you choose already has a value");
                    }
                }
                else
                    if (Space != Form3.unsolved[i - 1] || Space != Form3.unsolved[j - 1])
                    {
                        Exists_orNot = true;
                    }

                if (Exists_orNot == true)
                {
                    MessageBox.Show("Position you choose already has a value");
                }
                comboBox1.SelectedIndex = -1;
                comboBox2.SelectedIndex = -1;
                comboBox3.SelectedIndex = -1;
            }
            Form1 Form = new Form1();
            this.Visible = false;
            if (Value == Form3.solved[i * j - 1] || Value == Form3.solved[i - 1] || Value == Form3.solved[j - 1])
            {
                Form1 Form1 = Application.OpenForms["Form1"] as Form1;
                Form1.DrawChar1(i, j, Value);
                Form.Visible = true;
            }
            if (Form3.solved == Form3.unsolved)
            {
                
            }
        }
        private void Form5_Load(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            object index_row = comboBox1.SelectedItem;
            i = Convert.ToInt32(index_row);
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            object index_col = comboBox2.SelectedItem;
            j = Convert.ToInt32(index_col);
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            object index_value = comboBox3.SelectedItem;
            Value = Convert.ToChar(index_value);
        }
    }
}
