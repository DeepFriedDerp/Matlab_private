function [aeroForces] = paramSpace_4_4_3_2_2_3_3(sailStates,airStates)

	CL = (4.367788)*sailStates.alpha + (-0.473577)*sailStates.beta + (-2.925492)*sailStates.p + (41.942841)*sailStates.q + (2.162122)*sailStates.r + (0.011338)*sailStates.de;
	CD = -0.493510;
	CY = (0.087147)*sailStates.alpha + (-0.023797)*sailStates.beta + (0.743748)*sailStates.p + (-0.301042)*sailStates.q + (-0.147951)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.437264)*sailStates.alpha + (-0.500100)*sailStates.beta + (-1.449302)*sailStates.p + (13.252444)*sailStates.q + (1.750721)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-11.858895)*sailStates.alpha + (1.780898)*sailStates.beta + (8.686538)*sailStates.p + (-144.677322)*sailStates.q + (-7.195309)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.414611)*sailStates.alpha + (0.069690)*sailStates.beta + (-1.429363)*sailStates.p + (5.659626)*sailStates.q + (-0.006606)*sailStates.r + (0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end