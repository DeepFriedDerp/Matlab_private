function [aeroForces] = paramSpace_4_1_3_2_2_3_3(sailStates,airStates)

	CL = (4.367788)*sailStates.alpha + (0.473577)*sailStates.beta + (-2.925492)*sailStates.p + (41.942837)*sailStates.q + (2.162122)*sailStates.r + (0.011338)*sailStates.de;
	CD = -0.493510;
	CY = (0.087147)*sailStates.alpha + (-0.025775)*sailStates.beta + (0.743748)*sailStates.p + (-0.301042)*sailStates.q + (-0.147951)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.547055)*sailStates.alpha + (-0.209668)*sailStates.beta + (-1.543675)*sailStates.p + (14.440328)*sailStates.q + (1.769536)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-11.858895)*sailStates.alpha + (-1.780897)*sailStates.beta + (8.686539)*sailStates.p + (-144.677322)*sailStates.q + (-7.195309)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.534124)*sailStates.alpha + (0.071492)*sailStates.beta + (-1.410591)*sailStates.p + (5.423341)*sailStates.q + (-0.010348)*sailStates.r + (0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end