function [aeroForces] = paramSpace_2_1_1_1_2_2_1(sailStates,airStates)

	CL = (3.984442)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.845556)*sailStates.p + (26.534393)*sailStates.q + (0.205594)*sailStates.r + (0.009267)*sailStates.de;
	CD = -0.392040;
	CY = (0.008868)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.249136)*sailStates.p + (0.550478)*sailStates.q + (0.052896)*sailStates.r + (0.000115)*sailStates.de;

	Cl = (0.841844)*sailStates.alpha + (-0.146372)*sailStates.beta + (-0.703753)*sailStates.p + (4.815509)*sailStates.q + (0.420761)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-14.536785)*sailStates.alpha + (0.000000)*sailStates.beta + (7.061793)*sailStates.p + (-119.415161)*sailStates.q + (-0.581312)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (0.457522)*sailStates.alpha + (-0.031112)*sailStates.beta + (-0.719390)*sailStates.p + (3.237511)*sailStates.q + (-0.031796)*sailStates.r + (-0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end