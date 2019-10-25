function [aeroForces] = paramSpace_2_1_1_1_1_2_2(sailStates,airStates)

	CL = (5.726782)*sailStates.alpha + (-1.777212)*sailStates.beta + (-3.644637)*sailStates.p + (49.697414)*sailStates.q + (1.936537)*sailStates.r + (0.012683)*sailStates.de;
	CD = -5.091370;
	CY = (1.884607)*sailStates.alpha + (-0.120753)*sailStates.beta + (0.155069)*sailStates.p + (15.326375)*sailStates.q + (-0.014988)*sailStates.r + (0.003243)*sailStates.de;

	Cl = (-4.287271)*sailStates.alpha + (-0.929197)*sailStates.beta + (-1.841340)*sailStates.p + (15.786294)*sailStates.q + (2.149477)*sailStates.r + (0.001572)*sailStates.de;
	Cm = (0.705051)*sailStates.alpha + (7.889176)*sailStates.beta + (11.582759)*sailStates.p + (-163.769577)*sailStates.q + (-6.844656)*sailStates.r + (-0.068146)*sailStates.de;
	Cn = (-2.035356)*sailStates.alpha + (0.195919)*sailStates.beta + (-0.557602)*sailStates.p + (-10.089648)*sailStates.q + (-0.189624)*sailStates.r + (-0.004237)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end