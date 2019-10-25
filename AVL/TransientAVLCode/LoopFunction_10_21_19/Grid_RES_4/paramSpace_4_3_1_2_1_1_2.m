function [aeroForces] = paramSpace_4_3_1_2_1_1_2(sailStates,airStates)

	CL = (4.137128)*sailStates.alpha + (0.011887)*sailStates.beta + (-2.381682)*sailStates.p + (31.731464)*sailStates.q + (0.144604)*sailStates.r + (0.010050)*sailStates.de;
	CD = -0.252720;
	CY = (-0.090510)*sailStates.alpha + (-0.024251)*sailStates.beta + (-0.148492)*sailStates.p + (-0.756270)*sailStates.q + (0.029618)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.153300)*sailStates.alpha + (0.101464)*sailStates.beta + (-1.109536)*sailStates.p + (8.793304)*sailStates.q + (-0.150612)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-15.140493)*sailStates.alpha + (-0.092421)*sailStates.beta + (8.595755)*sailStates.p + (-133.768066)*sailStates.q + (-0.504498)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.177739)*sailStates.alpha + (-0.019251)*sailStates.beta + (0.533871)*sailStates.p + (-2.357148)*sailStates.q + (-0.032796)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end