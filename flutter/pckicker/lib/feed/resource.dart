import 'package:conditional_questions/conditional_questions.dart';

List<Question> questions() {
  return [
    PolarQuestion(
        question: "Do you believe the government should make it a requirement to have a permit to carry a firearm?",
        answers: ["Yes", "No"],
        //Lib
        isMandatory: true),
   PolarQuestion(
        question: "Do you believe the government should be in the business of expanding access to health care?",
        answers: ["Yes", "No"],
        //Lib
        isMandatory: true),
    PolarQuestion(
        question: "Do you believe the government should enact policies to reduce the threat of climate change?",
        answers: ["Yes", "No"],
        //LIB
        isMandatory: true),
    
    PolarQuestion(
        question: "Do you believe the government should intensify legal penalties for the use of drugs?",
        answers: ["Yes", "No"],
        // CONS
        isMandatory: true),
   PolarQuestion(
        question: "Do you believe the government should intensify legal penalties for illegal immigration?",
        answers: ["Yes", "No"],
        //Cons
        isMandatory: true),
    PolarQuestion(
        question: "Do you believe the government should increase its economic participation abroad, namely via international trade agreements?",
        answers: ["Yes", "No"],
        isMandatory: true),
    // Libs
    PolarQuestion(
        question: "Do you believe the government should increase its use of militaristic resources to fight terrorism? ",
        answers: ["Yes", "No"],
        //cons
        isMandatory: true),
   PolarQuestion(
        question: "Do you believe the government should tariff imports that outsell a product we make domestically? ",
        answers: ["Yes", "No"],
        //cons
        isMandatory: true),
    PolarQuestion(
        question: "Do you believe social media platforms should lose their ability to remove content they disagree with politically?",
        answers: ["Yes", "No"],
        //cons
        isMandatory: true),
    
      /*  
    NestedQuestion(
      question: "The series will depend on your answer",
      answers: ["Yes", "No"],
      children: {
        'Yes': [
          PolarQuestion(
              question: "Have you ever taken medication for H1n1?",
              answers: ["Yes", "No"]),
          PolarQuestion(
              question: "Have you ever taken medication for Rabies?",
              answers: ["Yes", "No"]),
          Question(
            question: "Comments",
          ),
        ],
        'No': [
          NestedQuestion(
              question: "Have you sustained any injuries?",
              answers: [
                "Yes",
                "No"
              ],
              children: {
                'Yes': [
                  PolarQuestion(
                      question: "Did it result in a disability?",
                      answers: ["Yes", "No", "I prefer not to say"]),
                ],
                'No': [
                  PolarQuestion(
                      question: "Have you ever been infected with chicken pox?",
                      answers: ["Yes", "No"]),
              
              
                ]
              }),
              
        ],
        
      },
    )
    */
  ];
}