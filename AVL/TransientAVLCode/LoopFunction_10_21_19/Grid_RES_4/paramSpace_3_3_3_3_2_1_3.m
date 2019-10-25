function [aeroForces] = paramSpace_3_3_3_3_2_1_3(sailStates,airStates)

	CL = (4.170023)*sailStates.alpha + (0.022378)*sailStates.beta + (-2.809734)*sailStates.p + (36.304874)*sailStates.q + (-0.280262)*sailStates.r + (0.010996)*sailStates.de;
	CD = -0.138670;
	CY = (-0.031228)*sailStates.alpha + (-0.024951)*sailStates.beta + (-0.214640)*sailStates.p + (-0.065300)*sailStates.q + (0.014066)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.360364)*sailStates.alpha + (0.115717)*sailStates.beta + (-1.398848)*sailStates.p + (11.351562)*sailStates.q + (-0.342895)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.810289)*sailStates.alpha + (-0.086651)*sailStates.beta + (9.768595)*sailStates.p + (-144.341232)*sailStates.q + (0.940411)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.062964)*sailStates.alpha + (-0.006720)*sailStates.beta + (0.570639)*sailStates.p + (-2.876881)*sailStates.q + (-0.008935)*sailStates.r + (-0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end