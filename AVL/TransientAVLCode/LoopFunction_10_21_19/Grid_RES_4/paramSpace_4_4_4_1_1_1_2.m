function [aeroForces] = paramSpace_4_4_4_1_1_1_2(sailStates,airStates)

	CL = (4.918466)*sailStates.alpha + (0.229878)*sailStates.beta + (-2.241235)*sailStates.p + (27.427885)*sailStates.q + (-0.835059)*sailStates.r + (0.008779)*sailStates.de;
	CD = -1.470330;
	CY = (-0.182397)*sailStates.alpha + (-0.018970)*sailStates.beta + (-0.526059)*sailStates.p + (-1.664522)*sailStates.q + (0.104461)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (1.012316)*sailStates.alpha + (0.383226)*sailStates.beta + (-1.022196)*sailStates.p + (7.233283)*sailStates.q + (-1.041118)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-15.113817)*sailStates.alpha + (-0.870265)*sailStates.beta + (8.997649)*sailStates.p + (-131.445847)*sailStates.q + (2.666565)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.342785)*sailStates.alpha + (-0.059921)*sailStates.beta + (1.442271)*sailStates.p + (-5.930655)*sailStates.q + (-0.039250)*sailStates.r + (0.000328)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end