function [aeroForces] = paramSpace_1_3_4_3_3_2_2(sailStates,airStates)

	CL = (3.991458)*sailStates.alpha + (0.064108)*sailStates.beta + (-2.466786)*sailStates.p + (35.289852)*sailStates.q + (-1.098923)*sailStates.r + (0.010764)*sailStates.de;
	CD = 0.039200;
	CY = (0.063161)*sailStates.alpha + (-0.024506)*sailStates.beta + (-0.277811)*sailStates.p + (0.489618)*sailStates.q + (-0.055207)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.232294)*sailStates.alpha + (0.142850)*sailStates.beta + (-1.138853)*sailStates.p + (9.730498)*sailStates.q + (-0.741843)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-14.010537)*sailStates.alpha + (-0.200317)*sailStates.beta + (8.018355)*sailStates.p + (-134.148560)*sailStates.q + (3.645883)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.020682)*sailStates.alpha + (0.024072)*sailStates.beta + (0.443115)*sailStates.p + (-1.817584)*sailStates.q + (-0.014733)*sailStates.r + (-0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end