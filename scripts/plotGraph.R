
ggplot(data=result, aes(x=CancerType, y=ano0, group=1), aes(x=CancerType, y=ano1, group=1)) +
  geom_line(color="red")+
  geom_point()

ggplot(result, aes( x = ano0)) + geom_bar()

#qplot(data = resultado) # + geom_point(mapping = aes(x = displ, y = hwy))
