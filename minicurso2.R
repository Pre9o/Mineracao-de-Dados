df = read.csv(url("https://gvheisler.github.io/ds/alunos.csv"))

media = mean(df$Attendance)

media2 = mean(df$Attendance[which(df$Parental_Involvement=="Low")])

media3 = mean(df$Attendance[which(df$Parental_Involvement=="High")])

