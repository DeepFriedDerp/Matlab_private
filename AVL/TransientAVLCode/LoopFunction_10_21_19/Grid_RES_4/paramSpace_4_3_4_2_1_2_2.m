function [aeroForces] = paramSpace_4_3_4_2_1_2_2(sailStates,airStates)

	CL = (3.920551)*sailStates.alpha + (-0.088026)*sailStates.beta + (-2.456804)*sailStates.p + (35.479534)*sailStates.q + (1.192551)*sailStates.r + (0.010500)*sailStates.de;
	CD = 0.059850;
	CY = (-0.098270)*sailStates.alpha + (-0.024093)*sailStates.beta + (0.363524)*sailStates.p + (-0.756269)*sailStates.q + (-0.072391)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.277688)*sailStates.alpha + (-0.177193)*sailStates.beta + (-1.132913)*sailStates.p + (9.751073)*sailStates.q + (0.868274)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-13.445210)*sailStates.alpha + (0.343670)*sailStates.beta + (7.898062)*sailStates.p + (-133.768066)*sailStates.q + (-4.012035)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.023129)*sailStates.alpha + (0.029951)*sailStates.beta + (-0.597827)*sailStates.p + (2.457879)*sailStates.q + (-0.009119)*sailStates.r + (0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end