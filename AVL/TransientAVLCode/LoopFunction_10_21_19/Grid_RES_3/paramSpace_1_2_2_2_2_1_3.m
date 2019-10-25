function [aeroForces] = paramSpace_1_2_2_2_2_1_3(sailStates,airStates)

	CL = (4.476147)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.962585)*sailStates.p + (41.741089)*sailStates.q + (-2.039263)*sailStates.r + (0.011591)*sailStates.de;
	CD = -0.495370;
	CY = (-0.085373)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.711680)*sailStates.p + (0.267958)*sailStates.q + (-0.125488)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.522135)*sailStates.alpha + (0.345151)*sailStates.beta + (-1.516990)*sailStates.p + (13.794177)*sailStates.q + (-1.665761)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-12.550593)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.993714)*sailStates.p + (-146.430145)*sailStates.q + (6.803745)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.436687)*sailStates.alpha + (0.060859)*sailStates.beta + (1.373560)*sailStates.p + (-5.480625)*sailStates.q + (-0.004358)*sailStates.r + (-0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end