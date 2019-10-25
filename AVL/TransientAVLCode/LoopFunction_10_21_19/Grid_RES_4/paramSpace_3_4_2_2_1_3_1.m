function [aeroForces] = paramSpace_3_4_2_2_1_3_1(sailStates,airStates)

	CL = (4.724089)*sailStates.alpha + (-0.314343)*sailStates.beta + (-2.163615)*sailStates.p + (32.686222)*sailStates.q + (1.484280)*sailStates.r + (0.010941)*sailStates.de;
	CD = -0.601300;
	CY = (-0.194770)*sailStates.alpha + (-0.024143)*sailStates.beta + (0.652591)*sailStates.p + (-0.668510)*sailStates.q + (-0.042750)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.281826)*sailStates.alpha + (-0.391442)*sailStates.beta + (-0.825001)*sailStates.p + (6.390880)*sailStates.q + (1.277312)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.147089)*sailStates.alpha + (1.176832)*sailStates.beta + (7.036289)*sailStates.p + (-124.743294)*sailStates.q + (-5.013436)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.750218)*sailStates.alpha + (0.017180)*sailStates.beta + (-1.407565)*sailStates.p + (6.829752)*sailStates.q + (0.012030)*sailStates.r + (0.000300)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end