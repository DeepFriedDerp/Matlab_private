function [aeroForces] = paramSpace_2_2_2_3_2_3_3(sailStates,airStates)

	CL = (4.170023)*sailStates.alpha + (0.022378)*sailStates.beta + (-2.809734)*sailStates.p + (36.304871)*sailStates.q + (0.280262)*sailStates.r + (0.010996)*sailStates.de;
	CD = -0.138670;
	CY = (0.031228)*sailStates.alpha + (-0.025002)*sailStates.beta + (0.214640)*sailStates.p + (0.065300)*sailStates.q + (0.014066)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.407779)*sailStates.alpha + (-0.104150)*sailStates.beta + (-1.431495)*sailStates.p + (11.755438)*sailStates.q + (0.340741)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.810289)*sailStates.alpha + (-0.086651)*sailStates.beta + (9.768596)*sailStates.p + (-144.341232)*sailStates.q + (-0.940411)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.056438)*sailStates.alpha + (-0.007691)*sailStates.beta + (-0.572779)*sailStates.p + (2.903352)*sailStates.q + (-0.009076)*sailStates.r + (0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end