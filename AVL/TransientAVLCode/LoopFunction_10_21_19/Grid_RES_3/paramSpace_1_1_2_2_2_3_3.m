function [aeroForces] = paramSpace_1_1_2_2_2_3_3(sailStates,airStates)

	CL = (4.097659)*sailStates.alpha + (0.031339)*sailStates.beta + (-2.807672)*sailStates.p + (35.090004)*sailStates.q + (0.005845)*sailStates.r + (0.010164)*sailStates.de;
	CD = -0.310080;
	CY = (0.071152)*sailStates.alpha + (-0.025506)*sailStates.beta + (0.230879)*sailStates.p + (0.267956)*sailStates.q + (0.040710)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.439904)*sailStates.alpha + (-0.129433)*sailStates.beta + (-1.507713)*sailStates.p + (12.564640)*sailStates.q + (0.225824)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-14.618088)*sailStates.alpha + (-0.167568)*sailStates.beta + (10.127974)*sailStates.p + (-145.513718)*sailStates.q + (0.032065)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.103339)*sailStates.alpha + (-0.028573)*sailStates.beta + (-0.770580)*sailStates.p + (4.219124)*sailStates.q + (-0.049178)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end