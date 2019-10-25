function [aeroForces] = paramSpace_2_2_4_3_3_2_3(sailStates,airStates)

	CL = (4.068131)*sailStates.alpha + (-0.019933)*sailStates.beta + (-2.822287)*sailStates.p + (37.079948)*sailStates.q + (-0.484036)*sailStates.r + (0.011215)*sailStates.de;
	CD = 0.022860;
	CY = (0.055284)*sailStates.alpha + (-0.025117)*sailStates.beta + (-0.144150)*sailStates.p + (0.563442)*sailStates.q + (-0.009389)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.395426)*sailStates.alpha + (0.038595)*sailStates.beta + (-1.434024)*sailStates.p + (11.968798)*sailStates.q + (-0.327624)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.695550)*sailStates.alpha + (0.041151)*sailStates.beta + (9.573407)*sailStates.p + (-144.107025)*sailStates.q + (1.599476)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.015491)*sailStates.alpha + (0.003249)*sailStates.beta + (0.240519)*sailStates.p + (-1.337648)*sailStates.q + (0.000079)*sailStates.r + (-0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end