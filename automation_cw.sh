num=''
for ((num=1; num<=3; num++ ))
do
	aws cloudwatch describe-alarms --alarm-names --profile $num  --query  'MetricAlarms[*].[AlarmName,StateValue]' --output text >> $num.txt
	#grep -v "OK" $num.txt | grep -v "TargetTracking-" $num.txt | grep -v "low-utilization" $num.txt > tmpfile && mv tmpfile $num.txt
	case $num in
		1)
			sed -i '1i Testing' $num.txt
			;;
		2)
		  sed -i '1i Davita' $num.txt
			;;
		3)
			sed -i '1i Stupendo' $num.txt
			;;
		esac

	grep -v "DescribeAlarms" $num.txt > tmpfile && mv tmpfile $num.txt
	grep -v "OK" $num.txt > tmpfile && mv tmpfile $num.txt
	grep -v "TargetTracking" $num.txt > tmpfile && mv tmpfile $num.txt
	grep -v "low-utilization" $num.txt > tmpfile && mv tmpfile $num.txt
	asi=$(tr '[:space:]' '[\n*]' < $num.txt | grep -i -c INSUFFICIENT_DATA)
	echo "Alarmas en estado insuficiente $asi " >> $num.txt
	grep -v "INSUFFICIENT_DATA" $num.txt > tmpfile && mv tmpfile $num.txt
  content=$(cat $num.txt >> rutina.txt)
done
mts=$(cat rutina.txt)
sh msg_to_slack.sh -h https://hooks.slack.com/services/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 -c ms-operations-event -u oscar.vargas -i scroll -F rutina.txt -T " test 3"
