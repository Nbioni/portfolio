class ExperienceData {
  String timelineTitle;
  String title;
  String time;
  String location;
  String company;
  String companyMobile;
  String companyImageUrl;
  String description;
  String skills;

  ExperienceData({
    required this.timelineTitle,
    required this.title,
    required this.time,
    required this.location,
    required this.company,
    required this.companyMobile,
    required this.companyImageUrl,
    required this.description,
    required this.skills,
  });
}

class MyExperience {
  List<ExperienceData> getExperience() {
    return [
      ExperienceData(
          timelineTitle: 'May \n 2022',
          title: 'Software Engineer',
          time: 'May 2022 - February 2023',
          location: 'Miami, Florida, USA - Remote',
          company: 'Codelitt',
          companyMobile: 'Codelitt',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C4E0BAQFNOAqn5rDz0A/company-logo_100_100/0/1561664918575?e=1700092800&v=beta&t=11f_vJW1RVSvYLPX3IFg17MistF7F4sYVFktN9eiGDk',
          description:
              '• Developed a modular Flutter project using clean architecture and an Atomic Design System.\n'
              '• Built a Chrome extension using the Design System in Flutter\n'
              '• Maintained a web solution in VueJS',
          skills:
              'VueJS · Figma (Software) · Dart · Cascading Style Sheets (CSS) · JavaScript · HTML · Flutter'),
      ExperienceData(
          timelineTitle: 'Jun \n 2021',
          title: 'Senior Developer / Tech Lead',
          time: 'June 2021 - May 2022',
          location: 'Goiânia, Goiás, Brazil - Remote',
          company: 'Trinus Co.',
          companyMobile: 'Trinus Co.',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C4D0BAQG0FbtYrTNa0A/company-logo_100_100/0/1669640130257?e=1700092800&v=beta&t=PwpKDx3okJyl_RGEfqN7PtoMwPzSdIaP7cNAEqO5670',
          description:
              '• Led a team in developing a backend solution in NestJS with Prisma ORM and a website in Flutter\n'
              '• Implemented Clean Architecture patterns and the Flutter Modular architecture made by the Flutterando community',
          skills:
              'Dart · Prisma ORM · NestJS · Cascading Style Sheets (CSS) · JavaScript · Node.js · HTML · Flutter'),
      ExperienceData(
          timelineTitle: 'November \n 2020',
          title: 'Software Engineer',
          time: 'November 2020 - January 2021',
          location: 'São Paulo, São Paulo, Brazil - Remote',
          company: 'K2 Improving Performance Consultoria',
          companyMobile: 'K2 Improving Performance\nConsultoria',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C4E0BAQGpPCXvC1NB1w/company-logo_100_100/0/1519873940618?e=1700092800&v=beta&t=K38uzIfzG22kK4yzu7K3yTo12YNnf2cVBzb9bufd0r0',
          description:
              '• Developed management and payment solutions using .NET',
          skills:
              'Cascading Style Sheets (CSS) · C# · ASP.NET MVC · JavaScript · HTML'),
      ExperienceData(
          timelineTitle: 'February \n 2020',
          title: 'Senior Developer',
          time: 'February 2020 - May 2020',
          location: 'Goiânia, Goiás, Brazil',
          company: 'TOCTEC',
          companyMobile: 'TOCTEC',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C560BAQEppnGo7Vgw-A/company-logo_100_100/0/1519883557641?e=1700092800&v=beta&t=DhgezJu1paQxv9b0nPaiGaJb8LW5VcG58ZxwBD-U4yg',
          description:
              '• Developed plugins for the BIM tool, web systems, and mobile applications (Flutter) for civil construction',
          skills: 'Building Information Modeling (BIM) · Flutter'),
      ExperienceData(
          timelineTitle: 'October \n 2019',
          title: 'Full-stack Developer',
          time: 'October 2019 - February 2020',
          location: 'Goiânia e Região, Brasil',
          company: 'Lidere Soluções',
          companyMobile: 'Lidere Soluções',
          companyImageUrl:
              'https://lh3.googleusercontent.com/QbTk_9UjQZGFd_DBTzC5CCcnGaUXlkpAVW0RLPr5gODeY4NpTkzJScHb122tpk0dJSDlcYLUac_vCyVo9wIuWkk9dnBczbPGIlQg=w1064-v0',
          description:
              '• Worked on Front-end, Sketch modeling in Adobe X.D., and application development in React Native',
          skills:
              'PHP · Cascading Style Sheets (CSS) · JavaScript · HTML · React Native · Adobe XD'),
      ExperienceData(
          timelineTitle: 'June \n 2019',
          title: 'Full-stack Developer',
          time: 'June 2019 - September 2019',
          location: 'Goiânia, Goiás, Brazil',
          company: 'Rede Frota',
          companyMobile: 'Rede Frota',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C4D0BAQF6gUYNJbfQlA/company-logo_100_100/0/1641303306018?e=1700092800&v=beta&t=DJ1_i6XaLEZA956GZgz0xKoxXoMZiGUa569pYEgjHBQ',
          description: '• Developed web solutions using Angular + TypeScript\n'
              '• Developed backend solutions using C#',
          skills:
              'ASP.NET Web API · Angular · TypeScript · Cascading Style Sheets (CSS) · C# · JavaScript · HTML'),
      ExperienceData(
          timelineTitle: 'October \n 2018',
          title: 'IT Analyst',
          time: 'October 2018 - June 2019',
          location: 'Goiânia, Goiás, Brazil',
          company: 'InfinIT Tecnologia',
          companyMobile: 'InfinIT Tecnologia',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C4D0BAQFQaac4VWakaw/company-logo_100_100/0/1519890908961?e=1700092800&v=beta&t=sCVzran5XekL9I5fZXb2wR9skzv9kTwiFzEMB3b4ZE8',
          description: '• Developed .NET C# system\n'
              '• Developed mobile projects in ReactJS\n'
              '• Conducted monitoring BI consultancies with Qlik Sense',
          skills:
              'ReactJS · Cascading Style Sheets (CSS) · C# · ASP.NET MVC · JavaScript · HTML · Qlik Sense'),
      ExperienceData(
          timelineTitle: 'November \n 2016',
          title: 'Internship',
          time: 'November 2016 - October 2018',
          location: 'Goiânia, Goiás, Brazil',
          company: 'Tribunal de Contas do Estado de Goiás',
          companyMobile: 'Tribunal de Contas do\nEstado de Goiás',
          companyImageUrl:
              'https://media.licdn.com/dms/image/C4E0BAQFife06jIe_Lg/company-logo_100_100/0/1673267924213?e=1700092800&v=beta&t=W0jRzcoyyzI4OHpMWGg5k04G_6F4qm3AEcwy-lfnk5I',
          description:
              '• Developed .NET solutions in C# using layered architecture, MVC, and Oracle PL/ SQL database\n'
              '• Worked on maintenance of legacy systems in VB6',
          skills:
              'Cascading Style Sheets (CSS) · C# · ASP.NET MVC · JavaScript · PL/SQL · HTML'),
      ExperienceData(
          timelineTitle: 'February \n 2014',
          title: 'Internship',
          time: 'February 2014 - January 2016',
          location: 'Goiânia, Goiás, Brazil',
          company: 'Secretaria Cidadã',
          companyMobile: 'Secretaria Cidadã',
          companyImageUrl:
              'https://lh3.googleusercontent.com/QbTk_9UjQZGFd_DBTzC5CCcnGaUXlkpAVW0RLPr5gODeY4NpTkzJScHb122tpk0dJSDlcYLUac_vCyVo9wIuWkk9dnBczbPGIlQg=w1064-v0',
          description: '• Developed Delphi 7 system\n'
              '• Worked on SQL Server database, system control, and sending payments for the "Renda Cidadã" and the "Projeto Pão e Leite" of the State of Goiás.',
          skills: 'Delphi 7 · Microsoft SQL Server'),
    ];
  }
}
