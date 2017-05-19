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
    public partial class Top3 : Form
    {
        public Top3()
        {
            InitializeComponent();
        }

        private void Top3_Load(object sender, EventArgs e)
        {
            textBox1.Text = Score.Top3_Names[0];
            textBox2.Text = Score.Top3_Names[1];
            textBox3.Text = Score.Top3_Names[2];
            textBox4.Text = Score.Top3[0].ToString();
            textBox5.Text = Score.Top3[1].ToString();
            textBox6.Text = Score.Top3[2].ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            this.Visible = false;
            form2.Visible = true;
        }

        private void Top3_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}   
