//
//  Constants.swift
//  SurfIntern
//
//  Created by Valery Keplin on 7.02.23.
//

struct C {
    static let identifier = "CustomTableViewCell"
    
    static let fieldsOfStudy: [String] = ["IOS",
                                          "Android",
                                          "Design",
                                          "QA",
                                          "Flutter",
                                          "PL",
                                          "Я",
                                          "хочу",
                                          "здесь",
                                          "стажироваться"
    ]
    
    struct Labels {
        static let buttonRequestLabel = "Отправить заявку"
        static let firstDescriptionLabel = "Работай над реальными задачами под рукодством опытного наставника и получи возможность стать частью команды мечты."
        static let secondDescriptionLabel = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        static let titelLabel = "Стажировка в Surf"
        static let questionLabel = "Хочешь к нам?"
    }
    
    struct Alert {
        static let title = "Поздравляем!"
        static let message = "Ваша заявка успешно отправлена!"
        static let addActionTitle = "Закрыть"
    }
}
