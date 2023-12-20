import { Sequelize, DataTypes } from "sequelize";

const db = {
    NAME: "licientadb",
    USERNAME: "root",
    PASSWORD: "",
    options: {
        dialect: "mysql",
        timezone: "+02:00",
        hots: "127.0.0.1",
        port: 3306,
        logging: function (sql) {
            console.log(sql);
        },
    },
};

export const sequelize = new Sequelize(
    db.NAME,
    db.USERNAME,
    db.PASSWORD,
    db.options
);

export const Users = sequelize.define(
    "Users",
    {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },
        fullName: {
            type: DataTypes.STRING(20),
            allowNull: false,
            unique: true,
        },
        password: {
            type: DataTypes.STRING(20),
            allowNull: false,
        },
        email: {
            type: DataTypes.STRING(50),
            allowNull: false,
            unique: true,
        },
        isServiceProvider: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
        },
        rating: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        addres: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        phone: {
            type: DataTypes.STRING(20),
            allowNull: true,
        },
    },
    {
        sequelize,
        freezeTableName: true,
        paranoid: true,
    }
);

export const Posts = sequelize.define(
    "Posts",
    {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },
        title: {
            type: DataTypes.STRING(20),
            allowNull: false,
        },
        description: {
            type: DataTypes.STRING(200),
            allowNull: false,
        },
        address: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        category: {
            type: DataTypes.STRING(20),
            allowNull: false,
        },
        specialRequirments: {
            type: DataTypes.STRING(200),
            allowNull: true,
        },
        preferredInterval: {
            type: DataTypes.STRING(20),
            allowNull: true,
        },
        preferredDays: {
            type: DataTypes.STRING(20),
            allowNull: true,
        },
        payCash: {
            type: DataTypes.BOOLEAN,
            allowNull: true,
            /*here i have to make sure that the user is a service provider, 
            and also from the front end that it will choose at least one option*/
        },
        payCard: {
            type: DataTypes.BOOLEAN,
            allowNull: true,
            /*here i have to make sure that the user is a service provider, 
            and also from the front end that it will choose at least one option*/
        },
        price: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        isNegotiable: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
        },
        image: {
            type: DataTypes.STRING(200),
            allowNull: true,
        },
        isDone: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
        },
        userID: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        serviceProviderID: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
    },
    {
        sequelize,
        freezeTableName: true,
        paranoid: true,
    },
);

Users.hasMany(Posts, {
    foreignKey: 'userID'
});
Posts.belongsTo(Users, {
    foreignKey: 'userID'
});