function [aeroForces] = paramSpace_1_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.286021)*sailStates.alpha + (0.110729)*sailStates.beta + (-1.938154)*sailStates.p + (27.845251)*sailStates.q + (0.515750)*sailStates.r + (0.010043)*sailStates.de;
	CD = -0.521430;
	CY = (0.009269)*sailStates.alpha + (-0.025821)*sailStates.beta + (0.351887)*sailStates.p + (0.715006)*sailStates.q + (0.046377)*sailStates.r + (0.000151)*sailStates.de;

	Cl = (0.927043)*sailStates.alpha + (-0.179433)*sailStates.beta + (-0.775167)*sailStates.p + (5.554014)*sailStates.q + (0.669193)*sailStates.r + (-0.000276)*sailStates.de;
	Cm = (-14.912363)*sailStates.alpha + (-0.496073)*sailStates.beta + (7.203208)*sailStates.p + (-121.082581)*sailStates.q + (-1.740218)*sailStates.r + (-0.067358)*sailStates.de;
	Cn = (0.484014)*sailStates.alpha + (-0.028487)*sailStates.beta + (-0.886894)*sailStates.p + (3.620688)*sailStates.q + (-0.015464)*sailStates.r + (-0.000140)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end