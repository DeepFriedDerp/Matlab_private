function [aeroForces] = paramSpace_2_2_2_2_1_3_3(sailStates,airStates)

	CL = (4.574331)*sailStates.alpha + (0.058618)*sailStates.beta + (-2.950134)*sailStates.p + (36.985836)*sailStates.q + (0.819121)*sailStates.r + (0.010983)*sailStates.de;
	CD = -0.519530;
	CY = (0.002924)*sailStates.alpha + (-0.024714)*sailStates.beta + (0.501771)*sailStates.p + (-0.668511)*sailStates.q + (0.032911)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.663064)*sailStates.alpha + (-0.206406)*sailStates.beta + (-1.549342)*sailStates.p + (12.705496)*sailStates.q + (0.823307)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-15.110770)*sailStates.alpha + (-0.224473)*sailStates.beta + (10.410042)*sailStates.p + (-148.601746)*sailStates.q + (-2.757004)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.006083)*sailStates.alpha + (-0.015756)*sailStates.beta + (-1.202376)*sailStates.p + (6.340741)*sailStates.q + (-0.018240)*sailStates.r + (0.000307)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end