using Plots
using DataFrames
using Colors

# Define the data
data = DataFrame(
    Role = ["PI", "PostDoc", "PostDoc", "Project Staff", "PhD Student", "MS Student", "MTech Student", "BTech Student"],
    Name = ["Dr. A", "Dr. B", "Dr. C", "Mr. C", "Ms. D", "Mr. E", "Ms. F", "Mr. G"],
    Start_Date_Expected = Date.([ "2010-01-01", "2018-02-01", "2018-02-01", "2019-03-01", "2016-09-01", "2017-01-01", "2019-07-01", "2020-08-01"]),
    End_Date_Expected = Date.([ "2024-12-31", "2020-12-31", "2020-12-31", "2024-12-31", "2020-08-31", "2018-12-31", "2021-06-30", "2021-05-31"]),
    Start_Date_Actual = Date.([ "2010-01-01", "2018-02-01", "2018-02-01", "2019-03-01", "2016-09-01", "2017-01-01", "2019-07-01", "2020-08-01"]),
    End_Date_Actual = Date.([ "2024-12-31", "2020-12-31", "2020-12-31", "2024-12-31", "2020-08-31", "2018-12-31", "2021-06-30", "2021-05-31"])
)

# Define colors for each role
role_colors = [RGB(0.1, 0.1, 0.1), RGB(0.3, 0.3, 0.3), RGB(0.3, 0.3, 0.3), RGB(0.5, 0.5, 0.5), RGB(0.6, 0.6, 0.6), RGB(0.7, 0.7, 0.7), RGB(0.8, 0.8, 0.8), RGB(0.9, 0.9, 0.9)]

# Prepare the plot
plot(legend=false, title="LogNitiLab Members' Involvement Period", xlabel="Date", ylabel="Members", yticks=(1:length(data.Name), data.Name))

# Plot expected periods
for i in 1:nrow(data)
    start_expected = data.Start_Date_Expected[i]
    end_expected = data.End_Date_Expected[i]
    barh!([i], [Dates.value(end_expected - start_expected)], left=[Dates.value(start_expected - Date(2000,1,1))], color=RGBA(role_colors[i].r, role_colors[i].g, role_colors[i].b, 0.5), label="Expected" if i==1 else "")
end

# Plot actual periods
for i in 1:nrow(data)
    start_actual = data.Start_Date_Actual[i]
    end_actual = data.End_Date_Actual[i]
    barh!([i], [Dates.value(end_actual - start_actual)], left=[Dates.value(start_actual - Date(2000,1,1))], color=role_colors[i], label="Actual" if i==1 else "")
end

# Display the plot
plot!()
