function [aeroForces] = paramSpace_7_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.152102)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.801359)*sailStates.p + (37.041191)*sailStates.q + (-0.626835)*sailStates.r + (0.011266)*sailStates.de;
	CD = -0.086990;
	CY = (-0.069247)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.240355)*sailStates.p + (-0.381224)*sailStates.q + (-0.008380)*sailStates.r + (-0.000083)*sailStates.de;

	Cl = (1.335624)*sailStates.alpha + (0.135609)*sailStates.beta + (-1.392353)*sailStates.p + (11.493781)*sailStates.q + (-0.561142)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.501358)*sailStates.alpha + (0.000000)*sailStates.beta + (9.497496)*sailStates.p + (-143.525848)*sailStates.q + (2.145024)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (0.087466)*sailStates.alpha + (0.004736)*sailStates.beta + (0.502705)*sailStates.p + (-1.810555)*sailStates.q + (-0.000401)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end