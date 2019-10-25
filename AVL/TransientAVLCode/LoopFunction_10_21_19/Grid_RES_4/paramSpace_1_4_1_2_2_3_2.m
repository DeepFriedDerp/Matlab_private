function [aeroForces] = paramSpace_1_4_1_2_2_3_2(sailStates,airStates)

	CL = (4.017460)*sailStates.alpha + (-0.003194)*sailStates.beta + (-2.383070)*sailStates.p + (31.483614)*sailStates.q + (0.031496)*sailStates.r + (0.009636)*sailStates.de;
	CD = -0.264790;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.227160)*sailStates.p + (0.000000)*sailStates.q + (0.045185)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.160608)*sailStates.alpha + (-0.117146)*sailStates.beta + (-1.082118)*sailStates.p + (8.289699)*sailStates.q + (0.250810)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-14.554840)*sailStates.alpha + (-0.025362)*sailStates.beta + (8.763592)*sailStates.p + (-133.820877)*sailStates.q + (-0.000414)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.309650)*sailStates.alpha + (-0.014900)*sailStates.beta + (-0.718422)*sailStates.p + (3.970962)*sailStates.q + (-0.050423)*sailStates.r + (0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end