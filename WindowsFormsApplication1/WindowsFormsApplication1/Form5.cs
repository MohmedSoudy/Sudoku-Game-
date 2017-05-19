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
        Form2 Form2;
        public bool Exists_orNot = false;
        public static Graphics G;
        public static int Wrong_Answers = 0;
        public static int Score = 0;
        public static int Index = 0;
        public static int Space_C = 0;
        public static int i;
        public static int j;
        public static char Value;
        public char Space= ' ';
        public Form5()
        {
            InitializeComponent();
        }
        void DrawChar1(int row, int col, char c)
        {

            Form1.Soduoko_board.DrawString("" + c, new Font(new FontFamily("Times New Roman"), 31, FontStyle.Bold), Brushes.Green, new PointF(col * 50 + 10, row * 50));
        }
        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            for (int Sp = 0; Sp < Form3.unsolved.Length; Sp++)
            {
                if (Form3.unsolved[Sp] == Space)
                {
                    Space_C++;
                }
            }
                i--;
                j--;
          if (i == -1 || j == -1 || Value == '\0')
            {
                MessageBox.Show("Enter a valid value :D");
                comboBox1.SelectedIndex = -1;
                comboBox2.SelectedIndex = -1;
                comboBox3.SelectedIndex = -1;
                return;
            }
            else
            {
                Index = (9 * i) + j;
                if (Form3.unsolved[Index] != ' ')
                {
                    MessageBox.Show("Invalid Position");
                    comboBox1.SelectedIndex = -1;
                    comboBox2.SelectedIndex = -1;
                    comboBox3.SelectedIndex = -1;
                    return;
                   
                }
                else
                {
                    if (Value == Form3.solved[Index])
                    {
                        DrawChar1(i, j, Value);
                        Score++;
                        Space_C--;
                        return;
                 
                    }
                    else
                    {
                        Wrong_Answers++;
                
                    }
            }
             

           }

            if (Space_C == 0)
            {
                this.Visible = false;
                Form3.stopwatch.Stop();
                Congratulations Cong = new Congratulations();
                Cong.Visible = true;
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

        private void Form5_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
