function [aeroForces] = paramSpace_3_4_3_1_2_3_3(sailStates,airStates)

	CL = (6.095397)*sailStates.alpha + (-0.614214)*sailStates.beta + (-3.489639)*sailStates.p + (44.538242)*sailStates.q + (2.674241)*sailStates.r + (0.011855)*sailStates.de;
	CD = -2.368940;
	CY = (0.399987)*sailStates.alpha + (-0.024526)*sailStates.beta + (1.168461)*sailStates.p + (-0.221994)*sailStates.q + (-0.076593)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.967266)*sailStates.alpha + (-0.747856)*sailStates.beta + (-1.890971)*sailStates.p + (16.516695)*sailStates.q + (2.409868)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-12.398877)*sailStates.alpha + (2.406778)*sailStates.beta + (11.147802)*sailStates.p + (-160.446381)*sailStates.q + (-9.071935)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-1.372303)*sailStates.alpha + (0.034331)*sailStates.beta + (-2.499265)*sailStates.p + (11.046608)*sailStates.q + (0.013932)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end