function [aeroForces] = paramSpace_1_1_2_1_1_1_2(sailStates,airStates)

	CL = (5.447810)*sailStates.alpha + (-0.678328)*sailStates.beta + (-2.679991)*sailStates.p + (42.695667)*sailStates.q + (-2.809244)*sailStates.r + (0.012001)*sailStates.de;
	CD = -1.849470;
	CY = (-0.238203)*sailStates.alpha + (-0.019316)*sailStates.beta + (-0.994713)*sailStates.p + (-1.664522)*sailStates.q + (-0.197801)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.135843)*sailStates.alpha + (0.374121)*sailStates.beta + (-1.285590)*sailStates.p + (12.433969)*sailStates.q + (-2.432014)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-9.257308)*sailStates.alpha + (2.603755)*sailStates.beta + (7.201849)*sailStates.p + (-136.195908)*sailStates.q + (9.340441)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.223411)*sailStates.alpha + (0.110155)*sailStates.beta + (2.097721)*sailStates.p + (-7.304245)*sailStates.q + (-0.015780)*sailStates.r + (0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end