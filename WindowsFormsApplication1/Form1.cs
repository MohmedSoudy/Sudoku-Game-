using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public static Graphics Soduoko_board;
        public Form1()
        {
            
            InitializeComponent();
            timer1.Start();
        }
        void DrawChar(int row, int col, char c)
        {
            Soduoko_board = pictureBox1.CreateGraphics();
            Soduoko_board.DrawString("" + c, new Font(new FontFamily("Times New Roman"), 31, FontStyle.Bold), Brushes.Black, new PointF(col * 50 + 10, row * 50));
        }
       public void DrawChar1(int row, int col, char c)
        {
            Soduoko_board = pictureBox1.CreateGraphics();
            Soduoko_board.DrawString("" + c, new Font(new FontFamily("Times New Roman"), 31, FontStyle.Bold), Brushes.Green, new PointF(col * 50 + 10, row * 50));
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            DrawBoard();
        }

        private void DrawBoard()
        {
                Soduoko_board = pictureBox1.CreateGraphics();
                for (int i = 0; i < 10; i++)
                {
                    Soduoko_board.DrawLine(Pens.Black, new Point(0, i * 50), new Point(450, i * 50));
                    Soduoko_board.DrawLine(Pens.Black, new Point(i * 50, 0), new Point(i * 50, 450));
                }

                for (int i = 0; i < 10; i++)
                {
                    if (i % 3 == 0)
                    {
                        Soduoko_board.DrawLine(new Pen(Brushes.Black, 3), new Point(0, i * 50), new Point(450, i * 50));
                        Soduoko_board.DrawLine(new Pen(Brushes.Black, 3), new Point(i * 50, 0), new Point(i * 50, 450));
                    }
                }
                int counter = 0;
                for (int i = 0; i < 9; i++)
                {
                    for (int j = 0; j < 9; j++)
                    {
                        DrawChar(i, j, Form3.unsolved[counter]);
                        counter++;
                    }
                }
            }
        

        private void Form1_Load(object sender, EventArgs e)
        {
            //Rows intialization
            textBox1.Text = "1";
            textBox2.Text = "2";
            textBox3.Text = "3";
            textBox4.Text = "4";
            textBox5.Text = "5";
            textBox6.Text = "6";
            textBox7.Text = "7";
            textBox8.Text = "8";
            textBox9.Text = "9";
            //Cols intalization
            textBox10.Text = "1";
            textBox11.Text = "2";
            textBox12.Text = "3";
            textBox13.Text = "4";
            textBox14.Text = "5";
            textBox15.Text = "6";
            textBox16.Text = "7";
            textBox17.Text = "8";
            textBox18.Text = "9";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form4 form4 = new Form4();
            this.Visible = false;
            form4.Visible = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //Load Solved Boards
            int Index = 0;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    DrawChar1(i, j, Form3.solved[Index]);
                    Index++;
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Load Unsolved Board
            int Index = 0;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    DrawChar(i, j, Form3.unsolved[Index]);
                    Index++;
                }
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Form5 form5 = new Form5();
            form5.Visible = true;
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

    }
}
