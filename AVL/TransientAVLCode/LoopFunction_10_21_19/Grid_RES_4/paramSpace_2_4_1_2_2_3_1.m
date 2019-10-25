function [aeroForces] = paramSpace_2_4_1_2_2_3_1(sailStates,airStates)

	CL = (4.304344)*sailStates.alpha + (-0.141800)*sailStates.beta + (-2.118291)*sailStates.p + (30.261089)*sailStates.q + (0.718954)*sailStates.r + (0.010403)*sailStates.de;
	CD = -0.385940;
	CY = (-0.078318)*sailStates.alpha + (-0.024926)*sailStates.beta + (0.396000)*sailStates.p + (-0.100924)*sailStates.q + (0.025966)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.021923)*sailStates.alpha + (-0.242316)*sailStates.beta + (-0.812953)*sailStates.p + (5.741261)*sailStates.q + (0.728471)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.696513)*sailStates.alpha + (0.494158)*sailStates.beta + (7.566953)*sailStates.p + (-125.105080)*sailStates.q + (-2.406203)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.530910)*sailStates.alpha + (-0.010626)*sailStates.beta + (-0.945733)*sailStates.p + (4.604126)*sailStates.q + (-0.010986)*sailStates.r + (0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end