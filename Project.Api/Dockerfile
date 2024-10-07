# Use the official .NET SDK image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the project files and restore dependencies
COPY *.csproj ./
RUN dotnet restore --verbosity detailed

# Copy the remaining files and build the project
COPY . ./
RUN dotnet publish -c Release -o out

# Use the official ASP.NET Core runtime image as a runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./

#Indetifying ports to be exposed
EXPOSE 80

ENTRYPOINT ["dotnet", "Project.Api.dll"]
