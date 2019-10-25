function [aeroForces] = paramSpace_1_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.502328)*sailStates.alpha + (-0.373075)*sailStates.beta + (-2.554785)*sailStates.p + (38.210468)*sailStates.q + (-1.894218)*sailStates.r + (0.011239)*sailStates.de;
	CD = -0.490740;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.667584)*sailStates.p + (0.000000)*sailStates.q + (-0.117713)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.444812)*sailStates.alpha + (0.220810)*sailStates.beta + (-1.230880)*sailStates.p + (11.198216)*sailStates.q + (-1.555339)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-12.540339)*sailStates.alpha + (1.395801)*sailStates.beta + (7.664882)*sailStates.p + (-134.612778)*sailStates.q + (6.320511)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.005171)*sailStates.alpha + (0.059679)*sailStates.beta + (1.331905)*sailStates.p + (-5.312497)*sailStates.q + (-0.001128)*sailStates.r + (-0.000111)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end