function [aeroForces] = paramSpace_4_3_3_2_1_3_2(sailStates,airStates)

	CL = (4.821216)*sailStates.alpha + (-0.160614)*sailStates.beta + (-2.534673)*sailStates.p + (39.033272)*sailStates.q + (2.207036)*sailStates.r + (0.011300)*sailStates.de;
	CD = -0.638240;
	CY = (-0.106013)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.817768)*sailStates.p + (-0.756271)*sailStates.q + (-0.162691)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.637904)*sailStates.alpha + (-0.426171)*sailStates.beta + (-1.157673)*sailStates.p + (10.699934)*sailStates.q + (1.793343)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-12.540987)*sailStates.alpha + (0.602585)*sailStates.beta + (7.238960)*sailStates.p + (-133.768066)*sailStates.q + (-7.325561)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.179154)*sailStates.alpha + (0.073589)*sailStates.beta + (-1.642420)*sailStates.p + (7.228126)*sailStates.q + (0.015782)*sailStates.r + (0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end