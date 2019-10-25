function [aeroForces] = paramSpace_4_2_3_3_3_3_2(sailStates,airStates)

	CL = (4.044468)*sailStates.alpha + (0.117737)*sailStates.beta + (-2.544150)*sailStates.p + (37.555031)*sailStates.q + (1.526678)*sailStates.r + (0.011055)*sailStates.de;
	CD = -0.126200;
	CY = (0.064741)*sailStates.alpha + (-0.024438)*sailStates.beta + (0.454172)*sailStates.p + (0.489619)*sailStates.q + (-0.090323)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.214042)*sailStates.alpha + (-0.212999)*sailStates.beta + (-1.203461)*sailStates.p + (10.695874)*sailStates.q + (1.202650)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-12.599174)*sailStates.alpha + (-0.446618)*sailStates.beta + (7.901869)*sailStates.p + (-135.545776)*sailStates.q + (-5.107757)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.116547)*sailStates.alpha + (0.048146)*sailStates.beta + (-0.841630)*sailStates.p + (2.624631)*sailStates.q + (-0.024259)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end