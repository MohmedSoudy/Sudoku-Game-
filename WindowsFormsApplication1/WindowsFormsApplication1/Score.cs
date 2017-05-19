using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Timers;
using System.IO;

namespace WindowsFormsApplication1
{
    public partial class Score : Form
    {
        public string File_Path = "Score.txt";
        public static int[] Top3 = new int[3];
        public static string []Top3_Names = new string[100];
        public Score()
        {
            InitializeComponent();
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
        }

        private void Score_Load(object sender, EventArgs e)
        {

            textBox4.Text = Form5.Wrong_Answers.ToString();
            textBox1.Text = Form5.Score.ToString();
            textBox2.Text = (Form3.stopwatch.Elapsed).ToString();

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            FileStream St = new FileStream("Score.txt", FileMode.OpenOrCreate);
            StreamWriter Sw = new StreamWriter(St);
            Sw.WriteLine("Player Name: " + textBox3.Text);
            Sw.WriteLine("Your Score is: " + Form5.Score);
            Sw.WriteLine("Wrong Answers: " + textBox4.Text);
            Sw.WriteLine("Your Time is: " + Form5.Wrong_Answers);
            
            /* using (StreamWriter sw = File.CreateText(File_Path))
            {
               sw.WriteLine("Player Name: " + textBox3.Text);
                sw.WriteLine("Your Score is: " + Form5.Score);
                sw.WriteLine("Wrong Answers: " + textBox4.Text);
                sw.WriteLine("Your Time is: " + Form5.Wrong_Answers);
                

            }*/
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Score_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void button3_Click(object sender, EventArgs e)
        {
        //    string[] Names = new string[100];
        //    string Name;
        //    int Score;
        //    int[] Scores = new int[100];
        //    FileStream Sw = new FileStream("Score.txt", FileMode.Open);
        //    StreamReader Sr = new StreamReader(Sw);
        //    string line;
        //    while ((line = Sr.ReadLine()) != null)
        //    {
        //        Name = Sr.ReadLine();
        //        Names[0] = Name;
        //        if (line == " ")
        //        {
        //            line = Sr.ReadLine();
        //        }
        //        Score = Convert.ToInt32(Sr.ReadLine());
        //        Scores[0] = Score;
        //    }
        //    int[] High_Scorse = new int[3];
        //    int Tmp;
        //    string Tmp1;
        //    for (int A = 0 ; A < Scores.Length - 1; A++)
        //    {
        //        if (Scores[A] < Scores[A+1])
        //        {
        //            Tmp = Scores[A];
        //            Tmp1 = Names[A];
        //            Scores[A] = Scores[A+1];
        //            Names[A] = Names[A + 1];
        //            Scores[A+1] = Tmp;
        //            Names[A + 1] = Tmp1;
        //        }
        //    }
        //    Top3 = High_Scorse;
        //    Top3_Names = Names;

        }
    }
}
