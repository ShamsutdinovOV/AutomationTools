FROM eclipse-temurin:11-jdk-alpine as build
WORKDIR ./
COPY pom.xml mvnw wait-for-it.sh ./
RUN apk add --no-cache maven
RUN mvn dependency:go-offline
COPY ./src ./src
RUN mvn package -DskipTests


FROM eclipse-temurin:8-jdk-alpine
WORKDIR /book
COPY --from=build ./target/*.jar app.jar
COPY wait-for-it.sh ./
RUN apk add --no-cache bash
RUN chmod +x wait-for-it.sh

# CMD ["./wait-for-it.sh", "-t", "100", "$POSTGRES_HOST:POSTGRES_PORT ", "--",\
#      "./wait-for-it.sh", "-t", "100", "$RABBIT_MQ_HOST:$RABBIT_MQ_PORT", "--",\
#      "./wait-for-it.sh", "-t", "100", "$HOTEL_SERVICE_HOST:$HOTEL_SERVICE_PORT", "--",\
#      "./wait-for-it.sh", "-t", "100", "$PAYMENT_SERVICE_HOST:$PAYMENT_SERVICE_PORT", "--",\
#      "./wait-for-it.sh", "-t", "100", "$LOYALTY_SERVICE_HOST:$LOYALTY_SERVICE_PORT", "--",\
#      "java", "-jar", "booking-service-0.0.1-SNAPSHOT.jar"]
CMD ./wait-for-it.sh -t 100 $POSTGRES_HOST:POSTGRES_PORT -- \
    ./wait-for-it.sh -t 100 $RABBIT_MQ_HOST:$RABBIT_MQ_PORT -- \
    ./wait-for-it.sh -t 100 $HOTEL_SERVICE_HOST:$HOTEL_SERVICE_PORT -- \
    ./wait-for-it.sh -t 100 $PAYMENT_SERVICE_HOST:$PAYMENT_SERVICE_PORT -- \
    ./wait-for-it.sh -t 100 $PAYMENT_SERVICE_HOST:$PAYMENT_SERVICE_PORT -- \
    ./wait-for-it.sh -t 100 $LOYALTY_SERVICE_HOST:$LOYALTY_SERVICE_PORT -- \
    java -jar app.jar

