function [aeroForces] = paramSpace_1_4_3_2_3_1_2(sailStates,airStates)

	CL = (4.786691)*sailStates.alpha + (0.458116)*sailStates.beta + (-2.516518)*sailStates.p + (38.716358)*sailStates.q + (-2.191011)*sailStates.r + (0.011221)*sailStates.de;
	CD = -0.636980;
	CY = (0.105276)*sailStates.alpha + (-0.022458)*sailStates.beta + (-0.801692)*sailStates.p + (0.756268)*sailStates.q + (-0.159439)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.573090)*sailStates.alpha + (0.508011)*sailStates.beta + (-1.117743)*sailStates.p + (10.226863)*sailStates.q + (-1.758585)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-12.540167)*sailStates.alpha + (-1.665492)*sailStates.beta + (7.186382)*sailStates.p + (-132.741791)*sailStates.q + (7.252023)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.221875)*sailStates.alpha + (0.068044)*sailStates.beta + (1.624633)*sailStates.p + (-7.290446)*sailStates.q + (0.017520)*sailStates.r + (-0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end