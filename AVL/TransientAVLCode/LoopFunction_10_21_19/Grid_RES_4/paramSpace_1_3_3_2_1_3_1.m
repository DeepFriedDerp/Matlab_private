function [aeroForces] = paramSpace_1_3_3_2_1_3_1(sailStates,airStates)

	CL = (4.300254)*sailStates.alpha + (-0.030097)*sailStates.beta + (-2.038129)*sailStates.p + (28.228405)*sailStates.q + (0.389795)*sailStates.r + (0.009789)*sailStates.de;
	CD = -0.448550;
	CY = (-0.192884)*sailStates.alpha + (-0.026064)*sailStates.beta + (0.422211)*sailStates.p + (-1.057312)*sailStates.q + (0.083945)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (1.142574)*sailStates.alpha + (-0.179276)*sailStates.beta + (-0.818911)*sailStates.p + (5.653921)*sailStates.q + (0.572398)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-15.551534)*sailStates.alpha + (0.131343)*sailStates.beta + (7.852565)*sailStates.p + (-125.069839)*sailStates.q + (-1.214142)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.716658)*sailStates.alpha + (-0.030215)*sailStates.beta + (-1.055741)*sailStates.p + (5.866328)*sailStates.q + (-0.063735)*sailStates.r + (0.000379)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end