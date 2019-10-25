function [aeroForces] = paramSpace_10_1_3_1_1_2_1(sailStates,airStates)

	CL = (5.212631)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.082675)*sailStates.p + (32.574257)*sailStates.q + (1.825370)*sailStates.r + (0.011129)*sailStates.de;
	CD = -0.991050;
	CY = (-0.285767)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.829244)*sailStates.p + (-0.839977)*sailStates.q + (-0.058016)*sailStates.r + (-0.000180)*sailStates.de;

	Cl = (1.512777)*sailStates.alpha + (-0.380683)*sailStates.beta + (-0.796464)*sailStates.p + (6.379797)*sailStates.q + (1.604975)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.185842)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.628397)*sailStates.p + (-122.784714)*sailStates.q + (-6.183230)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (1.051700)*sailStates.alpha + (0.026620)*sailStates.beta + (-1.787386)*sailStates.p + (8.586411)*sailStates.q + (0.016646)*sailStates.r + (0.000369)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end