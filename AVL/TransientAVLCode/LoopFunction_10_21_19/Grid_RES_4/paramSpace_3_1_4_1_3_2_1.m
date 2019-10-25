function [aeroForces] = paramSpace_3_1_4_1_3_2_1(sailStates,airStates)

	CL = (3.771713)*sailStates.alpha + (0.023298)*sailStates.beta + (-1.679230)*sailStates.p + (27.465864)*sailStates.q + (-0.216512)*sailStates.r + (0.010441)*sailStates.de;
	CD = -0.003770;
	CY = (0.311752)*sailStates.alpha + (-0.022135)*sailStates.beta + (-0.212691)*sailStates.p + (1.915493)*sailStates.q + (0.014143)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.757161)*sailStates.alpha + (0.010399)*sailStates.beta + (-0.535451)*sailStates.p + (3.581558)*sailStates.q + (-0.191458)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-13.811198)*sailStates.alpha + (-0.188386)*sailStates.beta + (5.926877)*sailStates.p + (-112.650780)*sailStates.q + (0.681140)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-0.554763)*sailStates.alpha + (-0.005418)*sailStates.beta + (0.458226)*sailStates.p + (-3.653372)*sailStates.q + (-0.015743)*sailStates.r + (-0.000585)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end