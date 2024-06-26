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
            unique: false,
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
            allowNull: true,
        },
        rating: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        address: {
            type: DataTypes.STRING(50),
            allowNull: true,
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
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        description: {
            type: DataTypes.STRING(3000),
            allowNull: false,
        },
        address: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        category: {
            type: DataTypes.STRING(60),
            allowNull: false,
        },
        specialRequirments: {
            type: DataTypes.STRING(500),
            allowNull: true,
        },
        preferredInterval: {
            type: DataTypes.STRING(150),
            allowNull: true,
        },
        preferredDays: {
            type: DataTypes.STRING(150),
            allowNull: true,
        },
        payCash: {
            type: DataTypes.BOOLEAN,
            allowNull: true,
        },
        payCard: {
            type: DataTypes.BOOLEAN,
            allowNull: true,
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
            type: DataTypes.STRING(500),
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