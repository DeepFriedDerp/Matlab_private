function [aeroForces] = paramSpace_3_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.258944)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.886735)*sailStates.p + (35.423412)*sailStates.q + (0.003591)*sailStates.r + (0.010302)*sailStates.de;
	CD = -0.456120;
	CY = (0.202075)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.213294)*sailStates.p + (1.304044)*sailStates.q + (0.037749)*sailStates.r + (0.000280)*sailStates.de;

	Cl = (1.336224)*sailStates.alpha + (-0.158677)*sailStates.beta + (-1.538314)*sailStates.p + (12.736711)*sailStates.q + (0.287162)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-14.960545)*sailStates.alpha + (0.000000)*sailStates.beta + (10.407318)*sailStates.p + (-148.140839)*sailStates.q + (-0.007927)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (-0.061045)*sailStates.alpha + (-0.027979)*sailStates.beta + (-0.751240)*sailStates.p + (3.228483)*sailStates.q + (-0.034565)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end