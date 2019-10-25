function [aeroForces] = paramSpace_15_1_1_2_1_1_1(sailStates,airStates)

	CL = (3.849317)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.165349)*sailStates.p + (31.349260)*sailStates.q + (0.655751)*sailStates.r + (0.010006)*sailStates.de;
	CD = 0.000870;
	CY = (-0.027835)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.035695)*sailStates.p + (-0.199285)*sailStates.q + (-0.008878)*sailStates.r + (-0.000042)*sailStates.de;

	Cl = (1.057008)*sailStates.alpha + (-0.010013)*sailStates.beta + (-0.947014)*sailStates.p + (7.748837)*sailStates.q + (0.295488)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-14.308490)*sailStates.alpha + (0.000000)*sailStates.beta + (7.477434)*sailStates.p + (-127.104668)*sailStates.q + (-2.210937)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (-0.154779)*sailStates.alpha + (0.002497)*sailStates.beta + (0.102023)*sailStates.p + (-0.835633)*sailStates.q + (-0.040595)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end