function [aeroForces] = paramSpace_4_1_3_1_1_2_1(sailStates,airStates)

	CL = (4.823911)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.978611)*sailStates.p + (27.588140)*sailStates.q + (0.978307)*sailStates.r + (0.010032)*sailStates.de;
	CD = -0.851580;
	CY = (-0.280904)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.647693)*sailStates.p + (-1.241891)*sailStates.q + (0.090983)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (1.328217)*sailStates.alpha + (-0.274030)*sailStates.beta + (-0.768733)*sailStates.p + (5.074955)*sailStates.q + (1.049011)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-16.092070)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.697437)*sailStates.p + (-123.350212)*sailStates.q + (-3.243528)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (1.041252)*sailStates.alpha + (-0.038512)*sailStates.beta + (-1.505675)*sailStates.p + (7.907084)*sailStates.q + (-0.048983)*sailStates.r + (0.000466)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end