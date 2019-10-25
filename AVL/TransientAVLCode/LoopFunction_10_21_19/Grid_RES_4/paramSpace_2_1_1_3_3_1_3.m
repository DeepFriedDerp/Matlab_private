function [aeroForces] = paramSpace_2_1_1_3_3_1_3(sailStates,airStates)

	CL = (4.302890)*sailStates.alpha + (-0.276345)*sailStates.beta + (-2.818972)*sailStates.p + (37.644451)*sailStates.q + (-1.161381)*sailStates.r + (0.011111)*sailStates.de;
	CD = -0.247490;
	CY = (0.017872)*sailStates.alpha + (-0.025566)*sailStates.beta + (-0.496844)*sailStates.p + (0.563443)*sailStates.q + (-0.032624)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.564001)*sailStates.alpha + (0.145701)*sailStates.beta + (-1.462345)*sailStates.p + (12.505080)*sailStates.q + (-1.010912)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.114036)*sailStates.alpha + (1.130526)*sailStates.beta + (9.351398)*sailStates.p + (-143.062866)*sailStates.q + (3.961307)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.091545)*sailStates.alpha + (0.016164)*sailStates.beta + (0.996329)*sailStates.p + (-4.489451)*sailStates.q + (0.005110)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end