function [aeroForces] = paramSpace_3_4_4_3_2_1_1(sailStates,airStates)

	CL = (4.092465)*sailStates.alpha + (0.055932)*sailStates.beta + (-2.269543)*sailStates.p + (31.838161)*sailStates.q + (-0.343341)*sailStates.r + (0.010551)*sailStates.de;
	CD = -0.124690;
	CY = (0.031915)*sailStates.alpha + (-0.024876)*sailStates.beta + (-0.221668)*sailStates.p + (0.065300)*sailStates.q + (0.014536)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.055129)*sailStates.alpha + (0.132019)*sailStates.beta + (-0.931862)*sailStates.p + (6.930117)*sailStates.q + (-0.379395)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.622307)*sailStates.alpha + (-0.158680)*sailStates.beta + (7.961519)*sailStates.p + (-129.003830)*sailStates.q + (1.132882)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.274704)*sailStates.alpha + (-0.005621)*sailStates.beta + (0.563048)*sailStates.p + (-2.875514)*sailStates.q + (-0.008284)*sailStates.r + (-0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end