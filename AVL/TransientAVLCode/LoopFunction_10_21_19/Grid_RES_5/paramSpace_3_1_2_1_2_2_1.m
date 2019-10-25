function [aeroForces] = paramSpace_3_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.146403)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.893488)*sailStates.p + (27.156130)*sailStates.q + (0.338879)*sailStates.r + (0.009673)*sailStates.de;
	CD = -0.455070;
	CY = (0.009565)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.292512)*sailStates.p + (0.624083)*sailStates.q + (0.051556)*sailStates.r + (0.000132)*sailStates.de;

	Cl = (0.859372)*sailStates.alpha + (-0.171149)*sailStates.beta + (-0.724372)*sailStates.p + (4.976855)*sailStates.q + (0.528213)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-14.825516)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.159891)*sailStates.p + (-120.478767)*sailStates.q + (-1.080585)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (0.474311)*sailStates.alpha + (-0.030178)*sailStates.beta + (-0.789445)*sailStates.p + (3.384844)*sailStates.q + (-0.023516)*sailStates.r + (-0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end