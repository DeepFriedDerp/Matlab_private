function [aeroForces] = paramSpace_1_3_2_3_1_1_2(sailStates,airStates)

	CL = (4.044468)*sailStates.alpha + (0.117737)*sailStates.beta + (-2.544150)*sailStates.p + (37.555031)*sailStates.q + (-1.526678)*sailStates.r + (0.011055)*sailStates.de;
	CD = -0.126190;
	CY = (-0.064741)*sailStates.alpha + (-0.025514)*sailStates.beta + (-0.454172)*sailStates.p + (-0.489619)*sailStates.q + (-0.090323)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.170109)*sailStates.alpha + (0.279166)*sailStates.beta + (-1.171923)*sailStates.p + (10.298901)*sailStates.q + (-1.196362)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-12.599174)*sailStates.alpha + (-0.446618)*sailStates.beta + (7.901869)*sailStates.p + (-135.545776)*sailStates.q + (5.107757)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.085450)*sailStates.alpha + (0.049751)*sailStates.beta + (0.847903)*sailStates.p + (-2.703594)*sailStates.q + (-0.023008)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end