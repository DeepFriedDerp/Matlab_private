function [aeroForces] = paramSpace_1_3_2_2_2_1_2(sailStates,airStates)

	CL = (4.502328)*sailStates.alpha + (0.373075)*sailStates.beta + (-2.554785)*sailStates.p + (38.210468)*sailStates.q + (-1.894218)*sailStates.r + (0.011239)*sailStates.de;
	CD = -0.490740;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.667584)*sailStates.p + (0.000000)*sailStates.q + (-0.117713)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.328790)*sailStates.alpha + (0.439587)*sailStates.beta + (-1.146244)*sailStates.p + (10.137351)*sailStates.q + (-1.540416)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-12.540339)*sailStates.alpha + (-1.395802)*sailStates.beta + (7.664882)*sailStates.p + (-134.612778)*sailStates.q + (6.320511)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.095198)*sailStates.alpha + (0.056767)*sailStates.beta + (1.346829)*sailStates.p + (-5.499557)*sailStates.q + (0.001503)*sailStates.r + (-0.000111)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end