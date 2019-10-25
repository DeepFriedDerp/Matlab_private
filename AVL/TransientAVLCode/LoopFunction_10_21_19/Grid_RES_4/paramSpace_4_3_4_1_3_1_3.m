function [aeroForces] = paramSpace_4_3_4_1_3_1_3(sailStates,airStates)

	CL = (6.102596)*sailStates.alpha + (0.099858)*sailStates.beta + (-3.210133)*sailStates.p + (34.414585)*sailStates.q + (-1.334436)*sailStates.r + (0.009369)*sailStates.de;
	CD = -2.398430;
	CY = (-0.258824)*sailStates.alpha + (-0.026147)*sailStates.beta + (-0.947521)*sailStates.p + (1.002333)*sailStates.q + (0.188581)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (2.415391)*sailStates.alpha + (0.459116)*sailStates.beta + (-1.823012)*sailStates.p + (14.267670)*sailStates.q + (-1.446956)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-15.931648)*sailStates.alpha + (-0.364611)*sailStates.beta + (12.948825)*sailStates.p + (-161.102386)*sailStates.q + (4.237750)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (0.629811)*sailStates.alpha + (-0.078570)*sailStates.beta + (2.480807)*sailStates.p + (-13.405483)*sailStates.q + (-0.133863)*sailStates.r + (-0.000544)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end