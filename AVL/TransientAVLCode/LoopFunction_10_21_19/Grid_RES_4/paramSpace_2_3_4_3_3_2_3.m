function [aeroForces] = paramSpace_2_3_4_3_3_2_3(sailStates,airStates)

	CL = (4.068131)*sailStates.alpha + (0.019933)*sailStates.beta + (-2.822287)*sailStates.p + (37.079948)*sailStates.q + (-0.484036)*sailStates.r + (0.011215)*sailStates.de;
	CD = 0.022860;
	CY = (0.055284)*sailStates.alpha + (-0.024835)*sailStates.beta + (-0.144150)*sailStates.p + (0.563442)*sailStates.q + (-0.009389)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.348723)*sailStates.alpha + (0.059809)*sailStates.beta + (-1.401373)*sailStates.p + (11.564919)*sailStates.q + (-0.325527)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.695548)*sailStates.alpha + (-0.041151)*sailStates.beta + (9.573409)*sailStates.p + (-144.107040)*sailStates.q + (1.599476)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.008111)*sailStates.alpha + (0.003201)*sailStates.beta + (0.242660)*sailStates.p + (-1.364120)*sailStates.q + (0.000216)*sailStates.r + (-0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end