function [aeroForces] = paramSpace_1_1_1_1_2_1_3(sailStates,airStates)

	CL = (1.969743)*sailStates.alpha + (-0.041001)*sailStates.beta + (-4.623004)*sailStates.p + (50.632454)*sailStates.q + (-0.696901)*sailStates.r + (0.011251)*sailStates.de;
	CD = -0.139140;
	CY = (0.177989)*sailStates.alpha + (-0.027040)*sailStates.beta + (-0.006544)*sailStates.p + (1.502844)*sailStates.q + (-0.001297)*sailStates.r + (0.000332)*sailStates.de;

	Cl = (0.549046)*sailStates.alpha + (-0.088708)*sailStates.beta + (-2.969731)*sailStates.p + (26.487024)*sailStates.q + (-0.370656)*sailStates.r + (0.003411)*sailStates.de;
	Cm = (-7.338915)*sailStates.alpha + (0.149178)*sailStates.beta + (15.993985)*sailStates.p + (-196.438232)*sailStates.q + (2.414010)*sailStates.r + (-0.075618)*sailStates.de;
	Cn = (-0.250002)*sailStates.alpha + (-0.014196)*sailStates.beta + (-0.542532)*sailStates.p + (3.634424)*sailStates.q + (-0.068673)*sailStates.r + (-0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end